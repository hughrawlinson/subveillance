class oscillatorBase{
  float frequency;
  float phase;
  oscillatorBase(float _frequency,float _phase){
    frequency = _frequency;
    phase = _phase;
  }
  void setFreq(float _frequency){
    frequency = _frequency;
  }
  void setPhase(float _phase){
    phase = _phase;
  }
  float getFreq(){
    return frequency;
  }
  float getPhase(){
    return phase;
  }
  float getValue(){
    return 0;
  }
}
