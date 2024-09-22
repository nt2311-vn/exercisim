import java.util.Locale;
import java.util.regex.Pattern;

class SqueakyClean {

    static String clean(String identifier) {

        var result =
                identifier
                        .replace(' ', '_')
                        .replaceAll("[α-ω]", "")
                        .replaceAll("\\p{C}", "CTRL")
                        .replaceAll("[^\\p{L}\\p{P}]", "");

        var matcher = Pattern.compile("(.*)(-\\p{L})(.*)").matcher(result);
        if (matcher.matches()) {
            result =
                    matcher.replaceAll(
                            matcher.group(1)
                                    + matcher.group(2).toUpperCase(Locale.ROOT).substring(1)
                                    + matcher.group(3));
        }

        return result;
    }
}
