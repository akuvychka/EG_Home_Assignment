package core.maps {

import core.view.mediators.TopMenuMediator;
import core.view.views.TopMenuView;

import org.robotlegs.core.IMediatorMap;

	public class ClientMapViews
	{
		private var mediatorMap:IMediatorMap;

		public function ClientMapViews(mediatorMap:IMediatorMap) {
			this.mediatorMap = mediatorMap;
			init();
		}

		private function init():void {
			mediatorMap.mapView(TopMenuView, TopMenuMediator);

		}
	}
}
