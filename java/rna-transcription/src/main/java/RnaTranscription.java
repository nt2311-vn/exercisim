import java.util.stream.Collectors;

class RnaTranscription {

  Character mapDNA(Character dna) {
    switch (dna) {
      case 'G':
        return 'C';

      case 'C':
        return 'G';

      case 'T':
        return 'A';

      case 'A':
        return 'U';

      default:
        return 'E';
    }
  }

  String transcribe(String dnaStrand) {
    return dnaStrand
        .chars()
        .mapToObj(c -> (char) c)
        .map(c -> mapDNA(c))
        .map(String::valueOf)
        .collect(Collectors.joining(""));
  }
}
