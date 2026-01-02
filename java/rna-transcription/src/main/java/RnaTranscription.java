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
    String rna = "";

    for (int i = 0; i < dnaStrand.length(); i++) {

      switch (dnaStrand.charAt(i)) {
        case 'G':
          rna += 'C';
          break;

        case 'C':
          rna += 'G';
          break;

        case 'T':
          rna += 'A';
          break;

        case 'A':
          rna += 'U';
          break;

        default:
          break;
      }
    }

    return rna;
  }
}
