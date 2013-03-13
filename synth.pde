import controlP5.*;
import themidibus.*;

MidiBus myBus;

AudioThread audioThread;

ControlP5 cp5;

sawOscillator Osc1;
sawOscillator SubOsc;
triOscillator Osc2;
noiseOscillator NoiseOsc;
envelope AmpEnv;
envelope FilterEnv;
lowPassFilter filter;

PImage background;
float[] drawBuffer;

// Synth Variables
float freq;
float frequency;
float GlideRate;
float LFORate;
float PitchAmt;
float FilterAmt;
float WaveAmt;
int Osc1Wave;
float Osc1Vol;
float SubOscVol;
float Osc2Vol;
float Osc2Freq;
float NoiseOscVol;
float FilterFreq;
float Resonance;
float MultiDrive;
float AmpAttack;
float AmpDecay;
float AmpSustain;
float AmpRelease;
float FilterAttack;
float FilterDecay;
float FilterSustain;
float FilterRelease;
int mostRecentlyPlayedMidiNote;

long index;
int knobRadius;

void setup() {
  myBus = new MidiBus(this, 2, 2);
  background = loadImage("background.png");
  size(1070,350);
  //smooth();
  drawBuffer = new float[2048];
  mostRecentlyPlayedMidiNote = -1;
  
  Osc1Vol = 0.5;
  
  Osc1 = new sawOscillator(440,0.0);
  SubOsc = new sawOscillator(0.0,0.0);
  Osc2 = new triOscillator(0.0,0.0);
  NoiseOsc = new noiseOscillator(0.0,0.0);
  AmpEnv = new envelope();
  FilterEnv = new envelope();
  filter = new lowPassFilter(44100);
  index = 0;
  knobRadius = 20;
  
  cp5 = new ControlP5(this);
  
  cp5setup();

  audioThread = new AudioThread();
  audioThread.start();
}
void draw(){
  //background(map(frequency,0,2600,0,255));
  image(background,0,0);
  filter.setResonance(Resonance);
  filter.setDrive(MultiDrive);
  stroke(0,255,0);
  strokeWeight(1);
  fill(0);
  rect(980,120,80,200);
  for(int i = 1; i < 2000; i += 10){
    line(1020+50*drawBuffer[i-1],(i-10)/10+120,1020+50*drawBuffer[i],i/10+120);
  }
  AmpEnv.set(AmpAttack,AmpDecay,AmpSustain,AmpRelease);
  FilterEnv.set(FilterAttack,FilterDecay,FilterSustain,FilterRelease);
  println(FilterEnv.getValue());
}
void generateAudioOut(float[] buffer){
  for (int i=0;i<buffer.length; i++){
    //filter.setFrequency(FilterFreq*FilterEnv.getValue());
    filter.setFrequency(FilterFreq*(float)FilterEnv.getValue());
    Osc1.setFreq(pow((float)2,(float)mostRecentlyPlayedMidiNote/(float)12)*frequency);
    Osc2.setFreq(Osc1.getFreq()*((pow(2,(Osc2Freq+12)/12)/8)*4));
    SubOsc.setFreq(Osc1.getFreq()/2);
    buffer[i] = filter.getValue(
      ((Osc1Vol*Osc1.getValue()) +
      (SubOscVol*SubOsc.getValue()) + 
      (Osc2Vol*Osc2.getValue()) + 
      (NoiseOscVol*NoiseOsc.getValue())
      ) *AmpEnv.getValue());
    index++;
  }
  drawBuffer = buffer;
}

void noteOn(int channel, int pitch, int velocity){
  AmpEnv.trigger();
  FilterEnv.trigger();
  mostRecentlyPlayedMidiNote = pitch;
}

void noteOff(int channel, int pitch, int velocity) {
  // Receive a noteOff
  if(pitch == mostRecentlyPlayedMidiNote){
    AmpEnv.release();
    FilterEnv.release();
  }
}

void keyPressed(){
  //saveFrame("screenshot.png");
}
