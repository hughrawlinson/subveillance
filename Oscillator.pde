class Oscillator{
  int mode;
  oscillatorBase[] oscillators;
  Oscillator(int _mode){
    oscillators = new oscillatorBase[3];
    oscillators[0] = new sinOscillator(0.0,0.0);
    oscillators[1] = new squareOscillator(0.0,0.0);
    oscillators[2] = new sawOscillator(0.0,0.0);
    oscillators[3] = new triOscillator(0.0,0.0);
    this.mode = _mode;
  }
  float getValue(){
    return oscillators[mode].getValue();
  }
  void setMode(int _mode){
    this.mode = _mode;
  }
  void setFreq(float _freq){
    for(int i = 0; i < oscillators.length; i++){
      oscillators[i].setFreq(_freq);
    }
  }
}
