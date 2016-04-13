package core.context {
import com.framework.bootstrap.FrameworkMapCommands;
import com.framework.bootstrap.FrameworkMapModels;
import com.framework.bootstrap.FrameworkMapServices;
import com.framework.bootstrap.FrameworkMapSignals;

import core.controller.signals.StartClientSignal;

import core.maps.ClientMapCommands;

import core.maps.ClientMapLayers;
import core.maps.ClientMapModels;
import core.maps.ClientMapServices;
import core.maps.ClientMapSignals;
import core.maps.ClientMapViews;

import org.osflash.signals.Signal;

import org.robotlegs.mvcs.SignalContext;


public class MainContext extends SignalContext{
    public function MainContext() {
    }

    override public function startup():void {

        new FrameworkMapCommands(signalCommandMap);
        new FrameworkMapSignals(injector);
        new FrameworkMapModels(injector);
        new FrameworkMapServices(injector);
        new ClientMapLayers(injector);

        new ClientMapCommands(signalCommandMap, injector);
        new ClientMapModels(injector);
        new ClientMapServices(injector);
        new ClientMapSignals(injector);
        new ClientMapViews(mediatorMap);


        startApp();
    }

    private function startApp():void {
        (injector.getInstance(StartClientSignal) as Signal).dispatch();
    }
}
}
