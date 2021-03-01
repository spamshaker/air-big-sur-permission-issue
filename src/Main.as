package {

  import flash.display.Sprite;
  import flash.display.StageQuality;
  import flash.display.StageScaleMode;
  import flash.events.Event;
  import flash.events.PermissionEvent;
  import flash.filesystem.File;
  import flash.text.TextField;
  import flash.text.TextFormat;

  [SWF(width="1000", height="500")]
  public class Main extends Sprite {
    public function Main() {
      stage.scaleMode = StageScaleMode.NO_SCALE;
      stage.quality = StageQuality.BEST;
      addEventListener(Event.ADDED_TO_STAGE, function (e: Event): void {
        const file: File = File.desktopDirectory;
        var textField: TextField = new TextField();
        textField.width = stage.stageWidth;
        textField.height = stage.stageHeight;
        textField.defaultTextFormat = new TextFormat("Arial", 16);
        textField.text = "Trying to open window for browse";

        stage.addChild(textField);
        file.addEventListener(PermissionEvent.PERMISSION_STATUS, function (event: PermissionEvent): void {
          try {
            file.browseForOpen("test");
            textField.text = "Window has been opened";
          } catch (e: Error) {
            textField.text = e.getStackTrace();

          }
          textField.text += "\n" + event.toString();
        })
        file.requestPermission();
      })

    }
  }
}
