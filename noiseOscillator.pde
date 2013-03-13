class noiseOscillator extends oscillatorBase{
  noiseOscillator(float _frequency,float _phase){
    super(_frequency,_phase);
  }
  float getValue(){
    phase++;
    return random(-1,1);
  }
}
