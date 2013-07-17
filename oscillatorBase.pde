class oscillatorBase{
  float frequency;
  long phase;
  oscillatorBase(float _frequency,float _phase){
    frequency = _frequency;
    phase = (long)_phase;
  }
  void setFreq(float _frequency){
    frequency = _frequency;
  }
  void setPhase(float _phase){
    phase = (long)_phase;
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
