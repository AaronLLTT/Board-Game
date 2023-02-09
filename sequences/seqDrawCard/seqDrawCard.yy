{
  "resourceType": "GMSequence",
  "resourceVersion": "1.4",
  "name": "seqDrawCard",
  "autoRecord": true,
  "backdropHeight": 768,
  "backdropImageOpacity": 0.5,
  "backdropImagePath": "",
  "backdropWidth": 1366,
  "backdropXOffset": 0.0,
  "backdropYOffset": 0.0,
  "events": {
    "resourceType": "KeyframeStore<MessageEventKeyframe>",
    "resourceVersion": "1.0",
    "Keyframes": [
      {"resourceType":"Keyframe<MessageEventKeyframe>","resourceVersion":"1.0","Channels":{"0":{"resourceType":"MessageEventKeyframe","resourceVersion":"1.0","Events":[
              "MoveToPlayersHand",
            ],},},"Disabled":false,"id":"184d487b-d69f-4e2e-9e1f-784740dd272c","IsCreationKey":false,"Key":49.9999,"Length":1.0,"Stretch":false,},
    ],
  },
  "eventStubScript": {
    "name": "AnimCurveScripts",
    "path": "scripts/AnimCurveScripts/AnimCurveScripts.yy",
  },
  "eventToFunction": {},
  "length": 50.0,
  "lockOrigin": false,
  "moments": {
    "resourceType": "KeyframeStore<MomentsEventKeyframe>",
    "resourceVersion": "1.0",
    "Keyframes": [],
  },
  "parent": {
    "name": "Sequences",
    "path": "folders/Sequences.yy",
  },
  "playback": 0,
  "playbackSpeed": 60.0,
  "playbackSpeedType": 0,
  "showBackdrop": true,
  "showBackdropImage": false,
  "spriteId": null,
  "timeUnits": 1,
  "tracks": [
    {"resourceType":"GMGraphicTrack","resourceVersion":"1.0","name":"sprCardBack","builtinName":0,"events":[],"inheritsTrackColour":true,"interpolation":1,"isCreationTrack":false,"keyframes":{"resourceType":"KeyframeStore<AssetSpriteKeyframe>","resourceVersion":"1.0","Keyframes":[
          {"resourceType":"Keyframe<AssetSpriteKeyframe>","resourceVersion":"1.0","Channels":{"0":{"resourceType":"AssetSpriteKeyframe","resourceVersion":"1.0","Id":{"name":"sprCardBack","path":"sprites/sprCardBack/sprCardBack.yy",},},},"Disabled":false,"id":"6b541a8f-b930-4bd9-8fbe-80ca6be4e834","IsCreationKey":false,"Key":0.0,"Length":30.0,"Stretch":false,},
        ],},"modifiers":[
        {"resourceType":"LockedModifier","resourceVersion":"1.0",},
      ],"trackColour":4284369138,"tracks":[
        {"resourceType":"GMRealTrack","resourceVersion":"1.0","name":"image_speed","builtinName":17,"events":[],"inheritsTrackColour":true,"interpolation":1,"isCreationTrack":false,"keyframes":{"resourceType":"KeyframeStore<RealKeyframe>","resourceVersion":"1.0","Keyframes":[
              {"resourceType":"Keyframe<RealKeyframe>","resourceVersion":"1.0","Channels":{"0":{"resourceType":"RealKeyframe","resourceVersion":"1.0","AnimCurveId":null,"EmbeddedAnimCurve":null,"RealValue":0.0,},},"Disabled":false,"id":"6eab16eb-9fc1-4238-a1f6-a156146f9ab7","IsCreationKey":false,"Key":0.0,"Length":1.0,"Stretch":false,},
            ],},"modifiers":[
            {"resourceType":"LockedModifier","resourceVersion":"1.0",},
          ],"trackColour":4284369138,"tracks":[],"traits":0,},
        {"resourceType":"GMRealTrack","resourceVersion":"1.0","name":"origin","builtinName":16,"events":[],"inheritsTrackColour":true,"interpolation":1,"isCreationTrack":true,"keyframes":{"resourceType":"KeyframeStore<RealKeyframe>","resourceVersion":"1.0","Keyframes":[
              {"resourceType":"Keyframe<RealKeyframe>","resourceVersion":"1.0","Channels":{"0":{"resourceType":"RealKeyframe","resourceVersion":"1.0","AnimCurveId":null,"EmbeddedAnimCurve":null,"RealValue":0.0,},"1":{"resourceType":"RealKeyframe","resourceVersion":"1.0","AnimCurveId":null,"EmbeddedAnimCurve":null,"RealValue":0.0,},},"Disabled":false,"id":"3a42b67b-966a-4399-b763-155d8ee59afc","IsCreationKey":true,"Key":0.0,"Length":1.0,"Stretch":false,},
            ],},"modifiers":[
            {"resourceType":"LockedModifier","resourceVersion":"1.0",},
          ],"trackColour":4284369138,"tracks":[],"traits":0,},
        {"resourceType":"GMRealTrack","resourceVersion":"1.0","name":"position","builtinName":14,"events":[],"inheritsTrackColour":true,"interpolation":1,"isCreationTrack":false,"keyframes":{"resourceType":"KeyframeStore<RealKeyframe>","resourceVersion":"1.0","Keyframes":[
              {"resourceType":"Keyframe<RealKeyframe>","resourceVersion":"1.0","Channels":{"0":{"resourceType":"RealKeyframe","resourceVersion":"1.0","AnimCurveId":null,"EmbeddedAnimCurve":{"resourceType":"GMAnimCurve","resourceVersion":"1.2","name":"","channels":[
                        {"resourceType":"GMAnimCurveChannel","resourceVersion":"1.0","name":"x","colour":4290799884,"points":[
                            {"th0":0.0,"th1":0.03674997,"tv0":0.0,"tv1":0.0,"x":0.0,"y":617.0,},
                            {"th0":-0.073102705,"th1":0.05953023,"tv0":104.81276,"tv1":-84.00223,"x":0.18711945,"y":433.67715,},
                            {"th0":-0.02882345,"th1":0.023843354,"tv0":0.0,"tv1":-19.489172,"x":0.50071967,"y":-4.139776,},
                            {"th0":-0.16666666,"th1":0.0,"tv0":0.46782622,"tv1":0.0,"x":1.0,"y":0.0,},
                          ],"visible":true,},
                        {"resourceType":"GMAnimCurveChannel","resourceVersion":"1.0","name":"y","colour":4281083598,"points":[
                            {"th0":0.0,"th1":0.03674997,"tv0":0.0,"tv1":0.0,"x":0.0,"y":291.0,},
                            {"th0":-0.073102705,"th1":0.05953023,"tv0":11.330052,"tv1":-9.080475,"x":0.18711945,"y":74.32376,},
                            {"th0":-0.03333333,"th1":0.0123307705,"tv0":0.0,"tv1":0.0,"x":0.5,"y":100.60384,},
                            {"th0":-0.061653852,"th1":0.094435744,"tv0":-0.5285438,"tv1":0.8095751,"x":0.56165385,"y":104.19594,},
                            {"th0":-0.13333333,"th1":0.0,"tv0":0.0,"tv1":0.0,"x":1.0,"y":105.0,},
                          ],"visible":true,},
                      ],"function":2,},"RealValue":0.0,},"1":{"resourceType":"RealKeyframe","resourceVersion":"1.0","AnimCurveId":null,"EmbeddedAnimCurve":{"resourceType":"GMAnimCurve","resourceVersion":"1.2","name":"","channels":[
                        {"resourceType":"GMAnimCurveChannel","resourceVersion":"1.0","name":"x","colour":4290799884,"points":[
                            {"th0":0.0,"th1":0.03674997,"tv0":0.0,"tv1":0.0,"x":0.0,"y":617.0,},
                            {"th0":-0.073102705,"th1":0.05953023,"tv0":104.81276,"tv1":-84.00223,"x":0.18711945,"y":433.67715,},
                            {"th0":-0.02882345,"th1":0.023843354,"tv0":0.0,"tv1":-19.489172,"x":0.50071967,"y":-4.139776,},
                            {"th0":-0.16666666,"th1":0.0,"tv0":0.46782622,"tv1":0.0,"x":1.0,"y":0.0,},
                          ],"visible":true,},
                        {"resourceType":"GMAnimCurveChannel","resourceVersion":"1.0","name":"y","colour":4281083598,"points":[
                            {"th0":0.0,"th1":0.03674997,"tv0":0.0,"tv1":0.0,"x":0.0,"y":291.0,},
                            {"th0":-0.073102705,"th1":0.05953023,"tv0":11.330052,"tv1":-9.080475,"x":0.18711945,"y":74.32376,},
                            {"th0":-0.03333333,"th1":0.0123307705,"tv0":0.0,"tv1":0.0,"x":0.5,"y":100.60384,},
                            {"th0":-0.061653852,"th1":0.094435744,"tv0":-0.5285438,"tv1":0.8095751,"x":0.56165385,"y":104.19594,},
                            {"th0":-0.13333333,"th1":0.0,"tv0":0.0,"tv1":0.0,"x":1.0,"y":105.0,},
                          ],"visible":true,},
                      ],"function":2,},"RealValue":0.0,},},"Disabled":false,"id":"d5a6838f-717d-4416-a9bf-d81e1b16fe00","IsCreationKey":false,"Key":0.0,"Length":60.0,"Stretch":false,},
            ],},"modifiers":[
            {"resourceType":"LockedModifier","resourceVersion":"1.0",},
          ],"trackColour":4284369138,"tracks":[],"traits":0,},
        {"resourceType":"GMRealTrack","resourceVersion":"1.0","name":"rotation","builtinName":8,"events":[],"inheritsTrackColour":true,"interpolation":1,"isCreationTrack":true,"keyframes":{"resourceType":"KeyframeStore<RealKeyframe>","resourceVersion":"1.0","Keyframes":[
              {"resourceType":"Keyframe<RealKeyframe>","resourceVersion":"1.0","Channels":{"0":{"resourceType":"RealKeyframe","resourceVersion":"1.0","AnimCurveId":null,"EmbeddedAnimCurve":null,"RealValue":0.0,},},"Disabled":false,"id":"535b083d-d24f-4b5d-a6bb-f4dd1c12b576","IsCreationKey":false,"Key":0.0,"Length":1.0,"Stretch":false,},
            ],},"modifiers":[
            {"resourceType":"LockedModifier","resourceVersion":"1.0",},
          ],"trackColour":4284369138,"tracks":[],"traits":0,},
        {"resourceType":"GMRealTrack","resourceVersion":"1.0","name":"scale","builtinName":15,"events":[],"inheritsTrackColour":true,"interpolation":1,"isCreationTrack":false,"keyframes":{"resourceType":"KeyframeStore<RealKeyframe>","resourceVersion":"1.0","Keyframes":[
              {"resourceType":"Keyframe<RealKeyframe>","resourceVersion":"1.0","Channels":{"0":{"resourceType":"RealKeyframe","resourceVersion":"1.0","AnimCurveId":null,"EmbeddedAnimCurve":{"resourceType":"GMAnimCurve","resourceVersion":"1.2","name":"Scale","channels":[
                        {"resourceType":"GMAnimCurveChannel","resourceVersion":"1.0","name":"x","colour":4290799884,"points":[
                            {"th0":1.0,"th1":-1.0,"tv0":0.0,"tv1":0.0,"x":0.0,"y":1.5,},
                            {"th0":1.0,"th1":-1.0,"tv0":0.0,"tv1":0.0,"x":0.26491472,"y":1.3675427,},
                            {"th0":1.0,"th1":-1.0,"tv0":0.0,"tv1":0.0,"x":0.26666668,"y":1.5,},
                            {"th0":1.0,"th1":-1.0,"tv0":0.0,"tv1":0.0,"x":0.48333332,"y":0.0,},
                            {"th0":1.0,"th1":-1.0,"tv0":0.0,"tv1":0.0,"x":1.0,"y":1.0,},
                          ],"visible":true,},
                        {"resourceType":"GMAnimCurveChannel","resourceVersion":"1.0","name":"y","colour":4281083598,"points":[
                            {"th0":1.0,"th1":-1.0,"tv0":0.0,"tv1":0.0,"x":0.0,"y":1.5,},
                            {"th0":1.0,"th1":-1.0,"tv0":0.0,"tv1":0.0,"x":0.26666668,"y":1.5,},
                            {"th0":1.0,"th1":-1.0,"tv0":0.0,"tv1":0.0,"x":0.48333332,"y":1.5,},
                            {"th0":1.0,"th1":-1.0,"tv0":0.0,"tv1":0.0,"x":1.0,"y":1.0,},
                          ],"visible":true,},
                      ],"function":1,},"RealValue":0.0,},"1":{"resourceType":"RealKeyframe","resourceVersion":"1.0","AnimCurveId":null,"EmbeddedAnimCurve":{"resourceType":"GMAnimCurve","resourceVersion":"1.2","name":"","channels":[
                        {"resourceType":"GMAnimCurveChannel","resourceVersion":"1.0","name":"x","colour":4290799884,"points":[
                            {"th0":1.0,"th1":-1.0,"tv0":0.0,"tv1":0.0,"x":0.0,"y":1.5,},
                            {"th0":1.0,"th1":-1.0,"tv0":0.0,"tv1":0.0,"x":0.26491472,"y":1.3675427,},
                            {"th0":1.0,"th1":-1.0,"tv0":0.0,"tv1":0.0,"x":0.26666668,"y":1.5,},
                            {"th0":1.0,"th1":-1.0,"tv0":0.0,"tv1":0.0,"x":0.48333332,"y":0.0,},
                            {"th0":1.0,"th1":-1.0,"tv0":0.0,"tv1":0.0,"x":1.0,"y":1.0,},
                          ],"visible":true,},
                        {"resourceType":"GMAnimCurveChannel","resourceVersion":"1.0","name":"y","colour":4281083598,"points":[
                            {"th0":1.0,"th1":-1.0,"tv0":0.0,"tv1":0.0,"x":0.0,"y":1.5,},
                            {"th0":1.0,"th1":-1.0,"tv0":0.0,"tv1":0.0,"x":0.26666668,"y":1.5,},
                            {"th0":1.0,"th1":-1.0,"tv0":0.0,"tv1":0.0,"x":0.48333332,"y":1.5,},
                            {"th0":1.0,"th1":-1.0,"tv0":0.0,"tv1":0.0,"x":1.0,"y":1.0,},
                          ],"visible":true,},
                      ],"function":1,},"RealValue":0.0,},},"Disabled":false,"id":"523a1919-c039-4cc8-a030-92b1ea1f0fa1","IsCreationKey":false,"Key":0.0,"Length":60.0,"Stretch":false,},
            ],},"modifiers":[
            {"resourceType":"LockedModifier","resourceVersion":"1.0",},
          ],"trackColour":4284369138,"tracks":[],"traits":0,},
      ],"traits":0,},
    {"resourceType":"GMInstanceTrack","resourceVersion":"1.0","name":"objCardFront","builtinName":0,"events":[],"inheritsTrackColour":true,"interpolation":1,"isCreationTrack":false,"keyframes":{"resourceType":"KeyframeStore<AssetInstanceKeyframe>","resourceVersion":"1.0","Keyframes":[
          {"resourceType":"Keyframe<AssetInstanceKeyframe>","resourceVersion":"1.0","Channels":{"0":{"resourceType":"AssetInstanceKeyframe","resourceVersion":"1.0","Id":{"name":"objCardFront","path":"objects/objCardFront/objCardFront.yy",},},},"Disabled":false,"id":"0ac8319f-4df8-4369-a309-20d12b0e0b17","IsCreationKey":false,"Key":30.0,"Length":20.0,"Stretch":false,},
        ],},"modifiers":[
        {"resourceType":"LockedModifier","resourceVersion":"1.0",},
      ],"trackColour":4294097480,"tracks":[
        {"resourceType":"GMRealTrack","resourceVersion":"1.0","name":"origin","builtinName":16,"events":[],"inheritsTrackColour":true,"interpolation":1,"isCreationTrack":true,"keyframes":{"resourceType":"KeyframeStore<RealKeyframe>","resourceVersion":"1.0","Keyframes":[
              {"resourceType":"Keyframe<RealKeyframe>","resourceVersion":"1.0","Channels":{"0":{"resourceType":"RealKeyframe","resourceVersion":"1.0","AnimCurveId":null,"EmbeddedAnimCurve":null,"RealValue":0.0,},"1":{"resourceType":"RealKeyframe","resourceVersion":"1.0","AnimCurveId":null,"EmbeddedAnimCurve":null,"RealValue":0.0,},},"Disabled":false,"id":"55d11248-3965-4b1b-b669-b7e282a129c2","IsCreationKey":true,"Key":30.0,"Length":1.0,"Stretch":false,},
            ],},"modifiers":[
            {"resourceType":"LockedModifier","resourceVersion":"1.0",},
          ],"trackColour":4284369138,"tracks":[],"traits":0,},
        {"resourceType":"GMRealTrack","resourceVersion":"1.0","name":"position","builtinName":14,"events":[],"inheritsTrackColour":true,"interpolation":1,"isCreationTrack":false,"keyframes":{"resourceType":"KeyframeStore<RealKeyframe>","resourceVersion":"1.0","Keyframes":[
              {"resourceType":"Keyframe<RealKeyframe>","resourceVersion":"1.0","Channels":{"0":{"resourceType":"RealKeyframe","resourceVersion":"1.0","AnimCurveId":null,"EmbeddedAnimCurve":null,"RealValue":0.0,},"1":{"resourceType":"RealKeyframe","resourceVersion":"1.0","AnimCurveId":null,"EmbeddedAnimCurve":null,"RealValue":100.603836,},},"Disabled":false,"id":"6e69d5d7-eb35-4469-a734-94e67d535c73","IsCreationKey":false,"Key":30.0,"Length":1.0,"Stretch":false,},
            ],},"modifiers":[
            {"resourceType":"LockedModifier","resourceVersion":"1.0",},
          ],"trackColour":4284369138,"tracks":[],"traits":0,},
        {"resourceType":"GMRealTrack","resourceVersion":"1.0","name":"rotation","builtinName":8,"events":[],"inheritsTrackColour":true,"interpolation":1,"isCreationTrack":true,"keyframes":{"resourceType":"KeyframeStore<RealKeyframe>","resourceVersion":"1.0","Keyframes":[
              {"resourceType":"Keyframe<RealKeyframe>","resourceVersion":"1.0","Channels":{"0":{"resourceType":"RealKeyframe","resourceVersion":"1.0","AnimCurveId":null,"EmbeddedAnimCurve":null,"RealValue":0.0,},},"Disabled":false,"id":"25611fd1-fbbe-49a6-b1e8-031c4355d7b1","IsCreationKey":false,"Key":30.0,"Length":1.0,"Stretch":false,},
            ],},"modifiers":[
            {"resourceType":"LockedModifier","resourceVersion":"1.0",},
          ],"trackColour":4284369138,"tracks":[],"traits":0,},
        {"resourceType":"GMRealTrack","resourceVersion":"1.0","name":"scale","builtinName":15,"events":[],"inheritsTrackColour":true,"interpolation":1,"isCreationTrack":false,"keyframes":{"resourceType":"KeyframeStore<RealKeyframe>","resourceVersion":"1.0","Keyframes":[
              {"resourceType":"Keyframe<RealKeyframe>","resourceVersion":"1.0","Channels":{"0":{"resourceType":"RealKeyframe","resourceVersion":"1.0","AnimCurveId":null,"EmbeddedAnimCurve":{"resourceType":"GMAnimCurve","resourceVersion":"1.2","name":"Scale","channels":[
                        {"resourceType":"GMAnimCurveChannel","resourceVersion":"1.0","name":"x","colour":4290799884,"points":[
                            {"th0":0.0,"th1":0.1,"tv0":0.0,"tv1":0.0,"x":0.0,"y":0.0,},
                            {"th0":-0.1,"th1":0.0,"tv0":0.0,"tv1":-1.0931399E-07,"x":0.5,"y":-0.004361233,},
                            {"th0":-0.013333341,"th1":0.0,"tv0":-0.00057237555,"tv1":2.2719373E-08,"x":0.5973694,"y":1.7580184,},
                            {"th0":-0.026525047,"th1":0.023209406,"tv0":0.0001189602,"tv1":-4.5860324E-05,"x":0.6547298,"y":1.3599374,},
                            {"th0":-0.03315629,"th1":0.016578147,"tv0":0.0,"tv1":0.0,"x":0.72004765,"y":1.4671808,},
                            {"th0":-0.01657815,"th1":0.010677051,"tv0":0.0,"tv1":0.0,"x":0.779729,"y":1.4391229,},
                            {"th0":1.0,"th1":-1.0,"tv0":0.0,"tv1":0.0,"x":0.83294225,"y":1.5,},
                            {"th0":-0.0354066,"th1":0.0,"tv0":0.0,"tv1":0.0,"x":1.0,"y":1.5,},
                          ],"visible":true,},
                        {"resourceType":"GMAnimCurveChannel","resourceVersion":"1.0","name":"y","colour":4281083598,"points":[
                            {"th0":0.0,"th1":0.1,"tv0":0.0,"tv1":0.0,"x":0.0,"y":1.5,},
                            {"th0":-0.1,"th1":0.03333334,"tv0":0.0,"tv1":0.0,"x":0.5,"y":1.5,},
                            {"th0":-0.03333334,"th1":0.06666666,"tv0":0.0,"tv1":0.0,"x":0.6666667,"y":1.5,},
                            {"th0":-0.06666666,"th1":0.0,"tv0":0.0,"tv1":0.0,"x":1.0,"y":1.5,},
                          ],"visible":true,},
                      ],"function":1,},"RealValue":0.0,},"1":{"resourceType":"RealKeyframe","resourceVersion":"1.0","AnimCurveId":null,"EmbeddedAnimCurve":{"resourceType":"GMAnimCurve","resourceVersion":"1.2","name":"","channels":[
                        {"resourceType":"GMAnimCurveChannel","resourceVersion":"1.0","name":"x","colour":4290799884,"points":[
                            {"th0":0.0,"th1":0.1,"tv0":0.0,"tv1":0.0,"x":0.0,"y":0.0,},
                            {"th0":-0.1,"th1":0.0,"tv0":0.0,"tv1":-1.0931399E-07,"x":0.5,"y":-0.004361233,},
                            {"th0":-0.013333341,"th1":0.0,"tv0":-0.00057237555,"tv1":2.2719373E-08,"x":0.5973694,"y":1.7580184,},
                            {"th0":-0.026525047,"th1":0.023209406,"tv0":0.0001189602,"tv1":-4.5860324E-05,"x":0.6547298,"y":1.3599374,},
                            {"th0":-0.03315629,"th1":0.016578147,"tv0":0.0,"tv1":0.0,"x":0.72004765,"y":1.4671808,},
                            {"th0":-0.01657815,"th1":0.010677051,"tv0":0.0,"tv1":0.0,"x":0.779729,"y":1.4391229,},
                            {"th0":1.0,"th1":-1.0,"tv0":0.0,"tv1":0.0,"x":0.83294225,"y":1.5,},
                            {"th0":-0.0354066,"th1":0.0,"tv0":0.0,"tv1":0.0,"x":1.0,"y":1.5,},
                          ],"visible":true,},
                        {"resourceType":"GMAnimCurveChannel","resourceVersion":"1.0","name":"y","colour":4281083598,"points":[
                            {"th0":0.0,"th1":0.1,"tv0":0.0,"tv1":0.0,"x":0.0,"y":1.5,},
                            {"th0":-0.1,"th1":0.03333334,"tv0":0.0,"tv1":0.0,"x":0.5,"y":1.5,},
                            {"th0":-0.03333334,"th1":0.06666666,"tv0":0.0,"tv1":0.0,"x":0.6666667,"y":1.5,},
                            {"th0":-0.06666666,"th1":0.0,"tv0":0.0,"tv1":0.0,"x":1.0,"y":1.5,},
                          ],"visible":true,},
                      ],"function":1,},"RealValue":0.0,},},"Disabled":false,"id":"c07469c5-d300-4d0b-b923-e74cb35afaed","IsCreationKey":false,"Key":0.0,"Length":60.0,"Stretch":false,},
            ],},"modifiers":[
            {"resourceType":"LockedModifier","resourceVersion":"1.0",},
          ],"trackColour":4284369138,"tracks":[],"traits":0,},
      ],"traits":0,},
  ],
  "visibleRange": {
    "x": 0.0,
    "y": 49.9999,
  },
  "volume": 1.0,
  "xorigin": 618,
  "yorigin": 290,
}