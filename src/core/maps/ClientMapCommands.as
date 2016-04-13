package core.maps {
import core.controller.commands.ShowClientCommand;
import core.controller.commands.StartClientCommand;
import core.controller.signals.ShowClientSignal;
import core.controller.signals.StartClientSignal;

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
		}
	}
}
