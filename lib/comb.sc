FxComb : FxBase {

    *new { 
        var ret = super.newCopyArgs(nil, \none, (
		   delaytime: 0.05,
		   decaytime: 1.0,
		   delaydiff: 0.001,
		   secondmul: 0
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
		    var sig = In.ar(inBus, 2);
		    sig = CombC.ar(in: sig,
			    delaytime: \delaytime.kr(5),
			    decaytime: \decaytime.kr(5)
			) + CombC.ar(in: sig,
			    delaytime: \delaytime.kr(5) * \delaydiff.kr(5),
			    decaytime: \decaytime.kr(5),
			    mul:       \secondmul.kr(5)
			);
			sig = sig.tanh; 			// can get mightly loud!
		    Out.ar(outBus, sig);
        }).add;
    }
}
