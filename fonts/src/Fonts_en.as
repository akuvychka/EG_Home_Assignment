package {
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;

	public class Fonts_en extends Sprite {
		[Embed(source="../fonts/ObelixProB-cyr.ttf", fontName="Times New Roman", embedAsCFF=false, fontWeight="bold", mimeType="application/x-font")]
		public var Font0: Class;

		private var numFields:int = 0;
		private var prevField:TextField;

		public function Fonts_en() {
			showDebugTextField("Times New Roman", true,"qwerty");
		}

		public function showDebugTextField(fontname:String, bold:Boolean, characters:String):void {
			var textField:TextField = new TextField();
			textField.embedFonts = true;
			var textFormat:TextFormat = new TextFormat();
			textFormat.size = "16";
			textFormat.bold = bold;
			textFormat.font = fontname;
			textField.text = characters;
			textField.width = 960;
			textField.autoSize = TextFieldAutoSize.CENTER;
			textField.multiline = true;
			textField.wordWrap = true;

			if (prevField != null)
			{
				textField.y = prevField.textHeight + prevField.y;
			}
			textField.setTextFormat(textFormat);
			addChild(textField);

			textField.rotation = 20;

			numFields++;
			prevField = textField;

			trace(textField.getTextFormat().font);
		}
	}
}
