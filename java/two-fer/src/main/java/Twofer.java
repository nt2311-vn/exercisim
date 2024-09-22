public class Twofer {
    public String twofer(String name) {
        return name != null && !name.isBlank()
                ? "One for " + name + ", one for me."
                : "One for you, one for me.";
    }
}
