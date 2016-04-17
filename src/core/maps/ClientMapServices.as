package core.maps {

import core.model.interfaces.ICollageService;
import core.model.interfaces.IImageFactoryService;
import core.model.interfaces.IStartClientService;
import core.model.service.CollageService;
import core.model.service.ImageFactoryService;
import core.model.service.StartClientService;

import org.robotlegs.core.IInjector;

	public class ClientMapServices {
		private var injector:IInjector;

		public function ClientMapServices(injector:IInjector) {
			this.injector = injector;
			init();
		}

		private function init():void {
			injector.mapSingletonOf(IStartClientService, StartClientService);
            injector.mapSingletonOf(ICollageService, CollageService);
            injector.mapSingletonOf(IImageFactoryService, ImageFactoryService);
		}
	}
}
