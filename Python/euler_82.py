MAT_SIZE = 80


def get_matrix(path):
    with open(path, "r") as mat_file:
        mat_file_contents = mat_file.read()

        matrix_rows = mat_file_contents.split("\n")[:MAT_SIZE]

        matrix = [map(int, row.split(",")) for row in matrix_rows]
        return matrix


def compute_optimal_path(path_matrix):
    stored_results = [[None for _ in xrange(MAT_SIZE)] for _ in xrange(MAT_SIZE)]

    # any path necessarily includes the first el
    stored_results[0][0] = path_matrix[0][0]

    def determine_optimal_path_to_point(row_ind, column_ind):
        # if we have already computed the value
        if stored_results[row_ind][column_ind] is not None:
            return stored_results[row_ind][column_ind]

        # if we have to calculate the cached value
        else:
            # no matter what a path including that point will
            # include the matrix value of that point
            value_at_point = path_matrix[row_ind][column_ind]

            # if we are at the top row
            if row_ind == 0:
                optimal_result = value_at_point + determine_optimal_path_to_point(row_ind, column_ind - 1)

            # if we are on the left wall
            elif column_ind == 0:
                optimal_result = value_at_point + determine_optimal_path_to_point(row_ind - 1, column_ind)

            else:
                # if we go up from there
                top_result = value_at_point + determine_optimal_path_to_point(row_ind - 1, column_ind)
                left_result = value_at_point + determine_optimal_path_to_point(row_ind, column_ind - 1)
                optimal_result = min(top_result, left_result)

            # store the best value that we found and return it
            stored_results[row_ind][column_ind] = optimal_result
            return optimal_result

    return determine_optimal_path_to_point(MAT_SIZE - 1, MAT_SIZE - 1)


def optimal_path_sum(matrix_path):
    path_matrix = get_matrix(matrix_path)

    return compute_optimal_path(path_matrix)


if __name__ == "__main__":
    print "Optimal path sum: %s" % optimal_path_sum("p081_matrix.txt")
