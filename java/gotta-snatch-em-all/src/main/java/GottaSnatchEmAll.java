import java.util.HashSet;
import java.util.List;
import java.util.Set;

class GottaSnatchEmAll {

  static Set<String> newCollection(List<String> cards) {
    Set<String> collections = new HashSet<>();

    for (String card : cards) {
      collections.add(card);
    }

    return collections;
  }

  static boolean addCard(String card, Set<String> collection) {
    if (!collection.contains(card)) {
      collection.add(card);
      return true;
    }

    return false;
  }

  static boolean canTrade(Set<String> myCollection, Set<String> theirCollection) {
    if (myCollection.isEmpty() || theirCollection.isEmpty()) {
      return false;
    }

    int myNotExistCard = 0;
    int theirNotExistCard = 0;

    for (String card : theirCollection) {
      if (!myCollection.contains(card)) {
        myNotExistCard++;
      }
    }

    for (String card : myCollection) {
      if (!theirCollection.contains(card)) {
        theirNotExistCard++;
      }
    }

    return myNotExistCard >= 1 && theirNotExistCard >= 1;
  }

  static Set<String> commonCards(List<Set<String>> collections) {
    Set<String> common = new HashSet<>();

    if (!collections.isEmpty()) {
      common.addAll(collections.get(0));
      collections.forEach(common::retainAll);
    }

    return common;
  }

  static Set<String> allCards(List<Set<String>> collections) {
    Set<String> cards = new HashSet<>();

    for (Set<String> collection : collections) {
      for (String card : collection) {
        cards.add(card);
      }
    }

    return cards;
  }
}
