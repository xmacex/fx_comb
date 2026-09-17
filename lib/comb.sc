FxComb : FxBase {

    *new { 
        var ret = super.newCopyArgs(nil, \none, (
		   delaytime: 0.05,
		   decaytime: 1.0
        ), nil, 1);
        ^ret;
    }

    *initClass {
        FxSetup.register(this.new);
    }

    subPath {
        ^"/fx_comb";
    }  

    symbol {
        ^\fxComb;
    }

    addSynthdefs {
        SynthDef(\fxComb, {|inBus, outBus|
		    var sig = CombC.ar(in: In.ar(inBus, 2),
			    maxdelaytime: 0.2,
			    delaytime: \delaytime.kr(5),
			    decaytime: \decaytime.kr(5)
			);
		    Out.ar(outBus, sig);
        }).add;
    }

}