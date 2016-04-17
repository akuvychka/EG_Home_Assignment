package core.controller.commands
{
	import com.framework.base.controller.signals.AddViewSignal;
	import com.framework.base.model.components.AddViewVO;

import core.view.views.CollageObjectView;
import core.view.views.TopMenuView;

	import org.robotlegs.mvcs.SignalCommand;

	public class ShowClientCommand extends SignalCommand {
		[Inject]
		public var addViewSignal:AddViewSignal;

		override public function execute():void {
			var addViewVO:AddViewVO = new AddViewVO();
			addViewVO.viewClassRef = TopMenuView;
			addViewSignal.dispatch(addViewVO);

            var addViewVO:AddViewVO = new AddViewVO();
            addViewVO.viewClassRef = CollageObjectView;
            addViewSignal.dispatch(addViewVO);
		}
	}
}
