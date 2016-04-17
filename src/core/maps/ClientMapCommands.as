package core.maps {
import core.controller.commands.GenerateCollageCommand;
import core.controller.commands.OpenImageConfigCommand;
import core.controller.commands.ShowClientCommand;
import core.controller.commands.StartClientCommand;
import core.controller.commands.components.AddNewPhotoCommand;
import core.controller.commands.errors.ShowErrorCommand;
import core.controller.signals.GenerateCollageSignal;
import core.controller.signals.OpenImageConfigSignal;
import core.controller.signals.ShowClientSignal;
import core.controller.signals.StartClientSignal;
import core.controller.signals.components.AddNewPhotoSignal;
import core.controller.signals.errors.ShowErrorSignal;

import org.robotlegs.core.IInjector;
	import org.robotlegs.core.ISignalCommandMap;

	public class ClientMapCommands {
		private var signalCommandMap:ISignalCommandMap;
		private var injector:IInjector;

		public function ClientMapCommands(signalCommandMap:ISignalCommandMap, injector:IInjector) {
			this.signalCommandMap = signalCommandMap;
			this.injector = injector;
			init();
		}

		private function init():void {
			signalCommandMap.mapSignalClass(StartClientSignal, StartClientCommand);
			signalCommandMap.mapSignalClass(ShowClientSignal, ShowClientCommand);
            signalCommandMap.mapSignalClass(OpenImageConfigSignal, OpenImageConfigCommand);
            signalCommandMap.mapSignalClass(GenerateCollageSignal, GenerateCollageCommand);
            signalCommandMap.mapSignalClass(ShowErrorSignal, ShowErrorCommand);
            signalCommandMap.mapSignalClass(AddNewPhotoSignal, AddNewPhotoCommand);

		}
	}
}
