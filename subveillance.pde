import controlP5.*;
import themidibus.*;

MidiBus myBus;

AudioThread audioThread;

ControlP5 cp5;

noiseOscillator NoiseOsc;

Oscillator Osc1;
Oscillator Osc2;
Oscillator SubOsc;
envelope AmpEnv;
envelope FilterEnv;
lowPassFilter filter;
modulation mod;

PImage background;
float[] drawBuffer;

// Synth Variables
float freq;
float frequency;
float GlideRate;
float LFORate;
int ModSource;
float PitchAmt;
float FilterAmt;
float AmpAmt;
boolean oscTwoOnly;
int Osc1Wave;
int Osc2Wave;
int Osc1Octave;
int Osc2Octave;
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
float MasterVolume;
int mostRecentlyPlayedMidiNote;
float octave;

long index;
int knobRadius;

void setup() {
  mod = new modulation();
  myBus = new MidiBus(this, 2, 0);
  MidiBus.list();
  background = loadImage("background.png");
  size(1070,350);
  //smooth();
  drawBuffer = new float[2048];
  mostRecentlyPlayedMidiNote = -1;
  
  Osc1Vol = 0.5;
  octave = 0;
  
  Osc1 = new Oscillator(0);
  SubOsc = new Oscillator(0);
  Osc2 = new Oscillator(0);
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
  Osc1.setMode(Osc1Wave);
  SubOsc.setMode(Osc1Wave);
  Osc2.setMode(Osc2Wave);
  AmpEnv.set(AmpAttack,AmpDecay,AmpSustain,AmpRelease);
  FilterEnv.set(FilterAttack,FilterDecay,FilterSustain,FilterRelease);
  mod.setFreq(LFORate);
  mod.setModSource(ModSource);
  mod.setPitchAmt(PitchAmt);
  mod.setFilterAmt(FilterAmt);
  mod.setAmpAmt(AmpAmt);
  mod.setosc2only(true);
}
void generateAudioOut(float[] buffer){
  for (int i=0;i<buffer.length; i++){
    filter.setFrequency(clip(
      50+(
        (Float)(
          (float)FilterFreq*
          (float)FilterEnv.getValue()
        )
      )*mod.getFilterValue(),
      50.,
      20000.));
    Osc1.setFreq(pow(
      (float)2,(
        (float)mostRecentlyPlayedMidiNote+
        (float)octave+
        (float)(Osc1Octave*12.)-24+
        (float)mod.getPitchOsc1Value()
       )/ (float)12
     )*
     frequency);
    Osc2.setFreq(pow(
      (float)2,(
        (float)mostRecentlyPlayedMidiNote+
        (float)octave+
        (float)(Osc2Octave*12.)-24+
        (float)mod.getPitchValue()
        )/ (float)12)*
      frequency*(
        (pow(2,(
          Osc2Freq+12
        )/12)
        /8)*4));
    SubOsc.setFreq(pow((float)2,((float)mostRecentlyPlayedMidiNote+octave+mod.getPitchOsc1Value())/(float)12)*frequency/2);
    buffer[i] = clip((MasterVolume/10)*filter.getValue(
      ((Osc1Vol*Osc1.getValue()) +
      (SubOscVol*SubOsc.getValue()) + 
      (Osc2Vol*Osc2.getValue()) + 
      (NoiseOscVol*NoiseOsc.getValue())
      ) *AmpEnv.getValue())*mod.getAmpValue(),-1.,1.);
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

void octplu(){
  if (octave<24){
    octave += 12;
  }
}

void octsub(){
  if (octave>(-24)){
   octave -= 12;
  } 
}

float clip(float _in,float lowerLimit, float upperLimit){
  if(_in > upperLimit){
    return upperLimit;  
  }
  else if(_in < lowerLimit){
    return lowerLimit;
  }
  else{
    return _in;
  }
}

int clip(int _in,int lowerLimit, int upperLimit){
  if(_in > upperLimit){
    return upperLimit;  
  }
  else if(_in < lowerLimit){
    return lowerLimit;
  }
  else{
    return _in;
  }
}

long clip(long _in,long lowerLimit, long upperLimit){
  if(_in > upperLimit){
    return upperLimit;  
  }
  else if(_in < lowerLimit){
    return lowerLimit;
  }
  else{
    return _in;
  }
}
