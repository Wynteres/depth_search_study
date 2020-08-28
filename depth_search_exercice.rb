# frozen_string_literal: true
graph = {
  root: %i[giovanni],
  giovanni: %i[agostinho clemente],
  agostinho: %i[maria tereza],
  maria: %i[giacomo clara],
  tereza: %i[fortunato marieta domingos],
  fortunato: %i[est],
  est: %i[test]
}

def get_childen_depth(graph, node)
  return 0 if graph[node].nil? || graph[node].empty?

  max_depth = 0

  current_node = graph.delete(node)

  current_node.each do |item|
    depth = get_childen_depth(graph, item)
    max_depth = depth if max_depth < depth
  end

  max_depth + 1
end

puts get_childen_depth(graph, :root)
