package {
import core.context.MainContext;

import flash.display.Sprite;

public class EGHAMain extends Sprite {
    public function EGHAMain() {
        var clientContext:MainContext = new MainContext();
        clientContext.contextView = this;
    }
}
}
