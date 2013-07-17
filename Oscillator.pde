class Oscillator{
  int mode;
  float saw;
  float tri;
  float sin;
  float sqr;
  float freq;
  oscillatorBase[] oscillators;
  Oscillator(int _mode){
    oscillators = new oscillatorBase[4];
    oscillators[0] = new sinOscillator(0.0,0.0);
    oscillators[1] = new squareOscillator(0.0,0.0);
    oscillators[2] = new sawOscillator(0.0,0.0);
    oscillators[3] = new triOscillator(0.0,0.0);
    this.mode = _mode;
  }
  float getValue(){
    sin = oscillators[0].getValue();
    sqr = oscillators[1].getValue();
    saw = oscillators[2].getValue();
    tri = oscillators[3].getValue();
    switch(this.mode){
      case 0:
        return sin;
      case 1:
        return tri;
      case 2:
        return saw;
      case 3:
        return sqr;
      default:
        return 0.0;
    }
  }
  void setMode(int _mode){
    this.mode = _mode;
  }
  void setFreq(float _freq){
    this.freq = _freq;
    for(int i = 0; i < oscillators.length; i++){
      oscillators[i].setFreq(this.freq);
    }
  }
  float getFreq(){
    return this.freq;
  }
}
