class sawOscillator extends oscillatorBase{
  float valueIMinus1;
  
  sawOscillator(float _frequency,float _phase){
    super(_frequency,_phase);
    valueIMinus1 = 0;
  }
  
  float getValue(){
    phase++;
    float increment = 2/(1/(this.frequency/44100));
    float sample = (((1+valueIMinus1) + increment)%2)-1;
    valueIMinus1 = sample;
    return sample;
  }
}
