#TODO
CMake is broken right now.. sorry for this

##bare supercollider build



This program is linked against bare SuperCollider build, the diffenernt cmake options in non-standart SC build were made:

```
FFT_GREEN                        ON
NOVA_SIMD                        OFF
NO_AVAHI                         ON
SC_ED                            OFF
SC_EL                            OFF
SC_IDE                           OFF
SC_QT                            OFF
SC_VIM                           OFF
```

##further SuperCollider mods

to run this we need to get rid of qt functions .. i.e. commenting out:

```
*initClass {
  Class.initClassTree( GUI );
  GUI.add( this );
  //this.style = "Fusion";
  //this.palette = QPalette.light;
}

```

in /usr/local/share/SuperCollider/SCClassLibrary/Common/GUI/Base/QtGUI.sc (linux)


##result

```./helloSc``` runs SuperCollider console so whitin SC console ```().play``` should do *beep*
