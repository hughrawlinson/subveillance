void cp5setup(){
    cp5.addKnob("frequency")
     .setRange(1,4)
     .setValue(2)
     .setPosition(50,50)
     .setRadius(knobRadius)
     .setDragDirection(Knob.VERTICAL);
     
   cp5.addKnob("GlideRate")
     .setRange(0,255)
     .setValue(50)
     .setPosition(50,150)
     .setRadius(knobRadius)
     .setDragDirection(Knob.VERTICAL);
     
     
   cp5.addKnob("LFORate")
     .setRange(0,255)
     .setValue(50)
     .setPosition(125,50)
     .setRadius(knobRadius)
     .setDragDirection(Knob.VERTICAL);
     
   cp5.addKnob("PitchAmt")
     .setRange(0,255)
     .setValue(50)
     .setPosition(125,150)
     .setRadius(knobRadius)
     .setDragDirection(Knob.VERTICAL);
     
   cp5.addKnob("FilterAmt")
     .setRange(0,255)
     .setValue(50)
     .setPosition(125,250)
     .setRadius(knobRadius)
     .setDragDirection(Knob.VERTICAL);
     
   cp5.addKnob("ModSource")
     .setRange(0,5)
     .setValue(1)
     .setPosition(200,50)
     .setRadius(knobRadius)
     .setDragDirection(Knob.VERTICAL)
     .setNumberOfTickMarks(5)
     .setTickMarkLength(4)
     .snapToTickMarks(true);
  
   cp5.addKnob("WaveAmt")
     .setRange(0,255)
     .setValue(50)
     .setPosition(200,250)
     .setRadius(knobRadius)
     .setDragDirection(Knob.VERTICAL);
     
   cp5.addKnob("Osc1Octave")
     .setRange(1,4)
     .setValue(1)
     .setPosition(275,50)
     .setRadius(knobRadius)
     .setDragDirection(Knob.VERTICAL)
     .setNumberOfTickMarks(3)
     .setTickMarkLength(4)
     .snapToTickMarks(true);
     
   cp5.addKnob("Osc1Wave")
     .setRange(0,3)
     .setValue(0)
     .setPosition(275,250)
     .setRadius(knobRadius)
     .setDragDirection(Knob.VERTICAL)
     .setNumberOfTickMarks(3)
     .setTickMarkLength(4)
     .snapToTickMarks(true);
     
   cp5.addKnob("Osc2Octave")
     .setRange(1,4)
     .setValue(1)
     .setPosition(350,50)
     .setRadius(knobRadius)
     .setDragDirection(Knob.VERTICAL)
     .setNumberOfTickMarks(3)
     .setTickMarkLength(4)
     .snapToTickMarks(true);
     
   cp5.addKnob("Osc2Freq")
     .setRange(-12,12)
     .setValue(0)
     .setPosition(350,150)
     .setRadius(knobRadius)
     .setDragDirection(Knob.VERTICAL);
     
   cp5.addKnob("Osc2Wave")
     .setRange(0,255)
     .setValue(50)
     .setPosition(350,250)
     .setRadius(knobRadius)
     .setDragDirection(Knob.VERTICAL);
     
   cp5.addKnob("Osc1Vol")
     .setRange(0,1)
     .setValue(0.8)
     .setPosition(425,30)
     .setRadius(knobRadius)
     .setDragDirection(Knob.VERTICAL);
     
   cp5.addKnob("SubOscVol")
     .setRange(0,1)
     .setValue(0)
     .setPosition(455,110)
     .setRadius(knobRadius)
     .setDragDirection(Knob.VERTICAL);
     
   cp5.addKnob("Osc2Vol")
     .setRange(0,1)
     .setValue(0)
     .setPosition(425,190)
     .setRadius(knobRadius)
     .setDragDirection(Knob.VERTICAL);
     
   cp5.addKnob("NoiseOscVol")
     .setRange(0,1)
     .setValue(0)
     .setPosition(455,270)
     .setRadius(knobRadius)
     .setDragDirection(Knob.VERTICAL);
     
   cp5.addKnob("FilterFreq")
     .setRange(50,20000)
     .setValue(20000)
     .setPosition(542,40)
     .setRadius(40)
     .setDragDirection(Knob.VERTICAL);
     
   cp5.addKnob("Resonance")
     .setRange(sqrt(2),0.1)
     .setValue(50)
     .setPosition(530,150)
     .setRadius(knobRadius)
     .setDragDirection(Knob.VERTICAL);
     
   cp5.addKnob("EGAmount")
     .setRange(0,255)
     .setValue(50)
     .setPosition(530,250)
     .setRadius(knobRadius)
     .setDragDirection(Knob.VERTICAL);
     
   cp5.addKnob("MultiDrive")
     .setRange(1,100)
     .setValue(50)
     .setPosition(605,150)
     .setRadius(knobRadius)
     .setDragDirection(Knob.VERTICAL);
     
   cp5.addKnob("KBAmount")
     .setRange(0,255)
     .setValue(50)
     .setPosition(605,250)
     .setRadius(knobRadius)
     .setDragDirection(Knob.VERTICAL);
     
   cp5.addKnob("FilterAttack")
     .setRange(0,1000)
     .setValue(50)
     .setPosition(680,50)
     .setRadius(knobRadius)
     .setDragDirection(Knob.VERTICAL);
     
   cp5.addKnob("AmpAttack")
     .setRange(0,1000)
     .setValue(50)
     .setPosition(680,190)
     .setRadius(knobRadius)
     .setDragDirection(Knob.VERTICAL);
     
   cp5.addKnob("FilterDecay")
     .setRange(0,1000)
     .setValue(50)
     .setPosition(755,50)
     .setRadius(knobRadius)
     .setDragDirection(Knob.VERTICAL);
     
   cp5.addKnob("AmpDecay")
     .setRange(0,1000)
     .setValue(50)
     .setPosition(755,190)
     .setRadius(knobRadius)
     .setDragDirection(Knob.VERTICAL);
     
   cp5.addKnob("FilterSustain")
     .setRange(0,1)
     .setValue(1)
     .setPosition(830,50)
     .setRadius(knobRadius)
     .setDragDirection(Knob.VERTICAL);
     
   cp5.addKnob("AmpSustain")
     .setRange(0,1)
     .setValue(1)
     .setPosition(830,190)
     .setRadius(knobRadius)
     .setDragDirection(Knob.VERTICAL);
     
   cp5.addKnob("FilterRelease")
     .setRange(0,1000)
     .setValue(50)
     .setPosition(905,50)
     .setRadius(knobRadius)
     .setDragDirection(Knob.VERTICAL);
     
   cp5.addKnob("AmpRelease")
     .setRange(0,1000)
     .setValue(50)
     .setPosition(905,190)
     .setRadius(knobRadius)
     .setDragDirection(Knob.VERTICAL);
     
   cp5.addKnob("MasterVolume")
     .setRange(0,255)
     .setValue(50)
     .setPosition(980,50)
     .setRadius(knobRadius)
     .setDragDirection(Knob.VERTICAL);
     
   cp5.addButton("octsub")
     .setPosition(35,257)
     .setSize(30,30)
     .updateSize()
     ;
     
   cp5.addButton("octplu")
     .setPosition(75,257)
     .setSize(30,30)
     .updateSize()
     ;
     
   cp5.addToggle("oct2only")
     .setPosition(205,155)
     .setSize(30,30)
     .updateSize()
     ;
     
   cp5.addToggle("hardSync")
     .setPosition(280,155)
     .setSize(30,30)
     .updateSize()
     ;
}
