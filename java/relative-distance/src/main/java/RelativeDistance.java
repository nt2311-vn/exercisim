import java.util.ArrayDeque;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Queue;
import java.util.Set;

class RelativeDistance {
  private final Map<String, Set<String>> familyDict;

  RelativeDistance(Map<String, List<String>> familyTree) {
    this.familyDict = new HashMap<>();
    for (Map.Entry<String, List<String>> entry : familyTree.entrySet()) {
      String parent = entry.getKey();
      List<String> children = entry.getValue();
      for (String child : children) {
        familyDict.computeIfAbsent(parent, k -> new HashSet<>()).add(child);
        familyDict.computeIfAbsent(child, k -> new HashSet<>()).add(parent);
        for (String sib : children) {
          if (!sib.equals(child)) {
            familyDict.get(child).add(sib);
          }
        }
      }
    }
  }

  int degreeOfSeparation(String personA, String personB) {
    Queue<String> queue = new ArrayDeque<>();
    Map<String, Integer> distanceMap = new HashMap<>();
    queue.add(personA);
    distanceMap.put(personA, 0);

    while (!queue.isEmpty()) {
      String current = queue.poll();
      int currentDistance = distanceMap.get(current);

      for (String relative : familyDict.getOrDefault(current, Set.of())) {
        if (!distanceMap.containsKey(relative)) {
          distanceMap.put(relative, currentDistance + 1);
          queue.add(relative);
        }
      }
    }
    return distanceMap.getOrDefault(personB, -1);
  }
}
