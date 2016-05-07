import copy


MAT_SIZE = 80


def get_matrix(path):
    with open(path, "r") as mat_file:
        mat_file_contents = mat_file.read()

        matrix_rows = mat_file_contents.split("\n")[:MAT_SIZE]

        matrix = [map(int, row.split(",")) for row in matrix_rows]
        return matrix


class Node():

    def __init__(self, row, col, matrix_value):
        # shortest distance to this node
        # initialized at infinity
        self.distance = float("inf")
        self.row = row
        self.col = col
        self.matrix_value = matrix_value
        self.neighbors = []

    def __str__(self):
        return "NODE: (%s, %s), distance: %s" % (self.row, self.col, self.distance)


def dijkstra(node_list, beginning_node, end_node):
    """
    Takes in a list of nodes, what node to start with
    and what node to end with. Returns the distance
    from the start node to the end node.
    """
    # create a copy of the list to operate on
    node_list = copy.copy(node_list)

    popped_node = beginning_node
    while popped_node != end_node:

        # update the distance values
        for neighbour_node in popped_node.neighbors:
            new_distance = popped_node.distance + neighbour_node.matrix_value

            if new_distance < neighbour_node.distance:
                neighbour_node.distance = new_distance

        # select the node with the smallest distance value
        smallest_distance = float("inf")
        smallest_index = -1

        for node_index, node in enumerate(node_list):
            if node.distance < smallest_distance:
                smallest_distance = node.distance
                smallest_index = node_index

        popped_node = node_list.pop(smallest_index)

    return end_node.distance


def create_node_matrix(path_matrix):
    node_matrix = [[Node(row_ind, col_ind, path_matrix[row_ind][col_ind]) for col_ind, value in enumerate(row)] for row_ind, row in enumerate(path_matrix)]

    # add in the edges between nodes
    for row_ind, node_row in enumerate(node_matrix):
        for col_ind, node in enumerate(node_row):
            # node above
            if row_ind != 0:
                node.neighbors.append(node_matrix[row_ind - 1][col_ind])
            # node below
            if row_ind != MAT_SIZE - 1:
                node.neighbors.append(node_matrix[row_ind + 1][col_ind])

            # node to the left
            if col_ind != 0:
                node.neighbors.append(node_matrix[row_ind][col_ind - 1])

            # node to the right
            if col_ind != MAT_SIZE - 1:
                node.neighbors.append(node_matrix[row_ind][col_ind + 1])

    return node_matrix


def p_83():
    path_matrix = get_matrix("p083_matrix.txt")

    node_matrix = create_node_matrix(path_matrix)

    beginning_node = node_list[0][0]
    end_node = node_matrix[-1][-1]

    node_list = []

    for row in node_matrix:
        for node in row:
            node_list.append(node)

    return dijkstra(node_list, beginning_node, end_node)


def p_82():
    path_matrix = get_matrix("p082_matrix.txt")

    node_matrix = create_node_matrix(path_matrix)

    # create the begining
    beginning_node = Node(None, None, 0)
    beginning_node.distance = 0

    # have the beginning node point to all the nodes in
    # the first column
    for row_ind in xrange(MAT_SIZE):
        beginning_node.neighbors.append(node_matrix[row_ind][0])

    # create the end node and have all of the nodes point to it
    end_node = Node(None, None, 0)
    for row_ind in xrange(MAT_SIZE):
        node_matrix[row_ind][MAT_SIZE - 1].neighbors.append(end_node)

    # add all nodes besides the start
    # to the distance dictionary
    node_list = []
    for node_row in node_matrix:
        for node in node_row:
            node_list.append(node)

    node_list.append(end_node)

    return dijkstra(node_list, beginning_node, end_node)


if __name__ == "__main__":
    """
    Use Dijkstra's to compute the shortest
    path between a fake start node connected
    to all of the values in the first column
    and a fake end node connected to all
    of the values in the last column
    """
    print "Problem 82: %s" % p_82()
    print "Problem 83: %s" % p_83()
