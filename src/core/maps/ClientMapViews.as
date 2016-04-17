package core.maps {

import core.view.mediators.CollageObjectMediator;
import core.view.mediators.TopMenuMediator;
import core.view.mediators.windows.ErrorWindowMediator;
import core.view.views.CollageObjectView;
import core.view.views.TopMenuView;
import core.view.views.windows.ErrorWindowView;

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
            mediatorMap.mapView(ErrorWindowView, ErrorWindowMediator);
            mediatorMap.mapView(CollageObjectView, CollageObjectMediator);
		}
	}
}
