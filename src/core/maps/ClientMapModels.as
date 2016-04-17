package core.maps {
import core.model.models.CollageModel;
import core.model.models.ErrorModel;
import core.model.models.GeneralSettingsModel;

import org.robotlegs.core.IInjector;

	public class ClientMapModels {
		private var injector:IInjector;

		public function ClientMapModels(injector:IInjector) {
			this.injector = injector;
			init();
		}

		private function init():void {
			injector.mapSingleton(GeneralSettingsModel);
            injector.mapSingleton(ErrorModel);
            injector.mapSingleton(CollageModel)
		}
	}
}
