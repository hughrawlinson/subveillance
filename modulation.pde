class modulation{
  float pitchAmt;
  float filterAmt;
  float ampAmt;
  boolean osc2only;
  int modSource;
  sinOscillator sin;
  squareOscillator sqr;
  triOscillator tri;
  sawOscillator saw;
  
  modulation(){
    sin = new sinOscillator(0.,0.);
    tri = new triOscillator(0.,0.);
    sqr = new squareOscillator(0.,0.);
    saw = new sawOscillator(0.,0.);
  }
  
  void setFreq( float _freq){
    _freq = _freq/2;
    sin.setFreq(_freq);
    tri.setFreq(_freq);
    sqr.setFreq(_freq);
    saw.setFreq(_freq);
  }
  
  void setModSource(int _modsource){
    this.modSource = _modsource;
  }
  
  void setosc2only(boolean _osc2only){
    this.osc2only = _osc2only;
  }
  
  void setPitchAmt(float _pitchAmt){
    this.pitchAmt = _pitchAmt;
  }
  
  void setFilterAmt(float _filterAmt){
    this.filterAmt = _filterAmt;
  }
  
  void setAmpAmt(float _ampAmt){
    this.ampAmt = _ampAmt;
  }
  
  float getValue(){
      float sinVal = sin.getValue();
      float triVal = tri.getValue();
      float sawVal = saw.getValue();
      float sqrVal = sqr.getValue();
      
      switch(this.modSource){
        case 0:
          return sinVal;
        case 1:
          return triVal;
        case 2:
          return sawVal;
        case 3:
          return sqrVal;
        default:
          return 0.;
      }
  }
  
  float getPitchOsc1Value(){
    if(!this.osc2only){
      return this.getPitchValue();
    }
    else{
      return 0.;
    }
  }
  float getPitchValue(){
    return (this.getValue() * this.pitchAmt)/100;
  }
  float getFilterValue(){
    return (getValue()*this.filterAmt) + 1.;
  }
  float getAmpValue(){
    return (getValue()*this.ampAmt) + 1.;
  }
}
