unit OptionRecs;

interface

type
  TStealths = set of (stTopLeft, stTopRight, stBottomLeft, stBottomRight);

  TTabPos = (tpNone, tpTop, tpBottom, tpLeft, tpRight);

  TStandard = record
    AutoExpand:  Boolean;
    DeleteCheck: Boolean;
    Stealth:     Boolean;
    Expanded:    Boolean;
    Sound:       Boolean;
    SoundFile:   string;
    Pass:        Boolean;
    PassWord:    string;
  end;

  TDisplay = record
    HotTrack:  Boolean;
    PopHint:   Boolean;
    TabPos:    TTabPos;
    Stealths:  TStealths;
    Animation: Boolean;
  end;

  TClip = record
  	Enabled:     Boolean;
    Count:       Cardinal;
    ReadHistory: Boolean;
    AddFirst:    Boolean;
    NotPasteData:Boolean;
  end;

	TOptionRec = record
    Standard: TStandard;
    Display: TDisplay;
    Clip: TClip;
  end;



implementation

end.
