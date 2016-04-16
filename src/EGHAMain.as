package {
import core.context.MainContext;

import flash.display.Sprite;
[SWF(backgroundColor="#FFFFFF", frameRate="30", width="760", height="800")]
public class EGHAMain extends Sprite {
    public function EGHAMain() {
        var clientContext:MainContext = new MainContext();
        clientContext.contextView = this;
    }
}
}
