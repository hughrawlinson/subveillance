class sinOscillator extends oscillatorBase{
  sinOscillator(float _frequency,float _phase){
    super(_frequency,_phase);
  }
  float getValue(){
    phase++;
    return sin(((frequency*PI)/22050)*(float)phase);
  }
}
