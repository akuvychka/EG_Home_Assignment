package core.maps
{
	import com.framework.bootstrap.FrameworkMapLayers;

import core.consts.LayersNameConst;

import org.robotlegs.core.IInjector;

	public class ClientMapLayers extends FrameworkMapLayers
	{
		public function ClientMapLayers(injector:IInjector) {
			super(injector);
		}

		override protected function createLayersConfig():void {
			layersConfig[0] = LayersNameConst.MAIN_LAYER;
			layersConfig[1] = LayersNameConst.MENU_LAYER;
			layersConfig[2] = LayersNameConst.MODAL_LAYER;
		}
	}
}
