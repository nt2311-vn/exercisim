import java.util.ArrayDeque;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Queue;
import java.util.Set;
import java.util.stream.Collectors;
import java.util.stream.Stream;

class RelativeDistance {
  private final Map<String, List<String>> familyTree;

  RelativeDistance(Map<String, List<String>> familyTree) {
    this.familyTree = familyTree;
  }

  int degreeOfSeparation(String personA, String personB) {
    Queue<String> queue = new ArrayDeque<>();
    Map<String, Integer> distance = new HashMap<>();
    queue.add(personA);

    distance.put(personA, 0);

    while (!queue.isEmpty()) {
      String current = queue.poll();
      int currentDistance = distance.get(current);

      for (String relative : getRelatives(current)) {
        if (distance.containsKey(relative)) continue;
        if (relative.equals(personB)) return currentDistance + 1;

        distance.put(relative, currentDistance + 1);
        queue.add(relative);
      }
    }

    return -1;
  }

  private Set<String> getRelatives(String person) {
    List<String> parents = familyTree.getOrDefault(person, List.of());
    List<String> children =
        familyTree.entrySet().stream()
            .filter(e -> e.getValue().contains(person))
            .map(Map.Entry::getKey)
            .toList();

    List<String> spouses =
        familyTree.values().stream()
            .filter(l -> l.contains(person))
            .flatMap(List::stream)
            .filter(s -> !s.equals(person))
            .toList();

    return Stream.of(parents, children, spouses).flatMap(List::stream).collect(Collectors.toSet());
  }
}
