
public class EventProcessor {

  @Scheduled(fixedDelay = 50, initialDelay = 1000)
  public runOnce() {
    runMainThread();
  }

}

