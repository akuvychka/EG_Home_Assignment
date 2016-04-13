package core.maps {
import core.model.interfaces.ISettings;
import core.model.models.GeneralSettingsModel;

import org.robotlegs.core.IInjector;

	public class ClientMapModels {
		private var injector:IInjector;

		public function ClientMapModels(injector:IInjector) {
			this.injector = injector;
			init();
		}

		private function init():void {
			injector.mapSingletonOf(ISettings, GeneralSettingsModel);
		}
	}
}
