class Triangle():
	def __init__(self, value):
		self.value = value
		self.left_child = None
		self.right_child = None
		self.path_sum = -1

	def set_children(self, left_child, right_child):
		self.left_child = left_child
		self.right_child = right_child

	def max_path_sum(self):
		# if we have already calculated the max path sum
		if self.path_sum > 0:
			return self.path_sum
		if self.left_child is None or self.right_child is None:
			self.path_sum = self.value
			return self.value
		else:
			max_sum = self.value + max(self.left_child.max_path_sum(), self.right_child.max_path_sum())
			self.path_sum = max_sum
			return max_sum


def initialize_triangle(input_list, number_of_rows):
	triangle_array = [Triangle(value) for value in input_list]
	triangle_index = 0
	for row_size in xrange(1, number_of_rows + 1):
		for row_index in xrange(row_size):
			relevant_triangle = triangle_array[triangle_index]
			try:
				relevant_triangle.set_children(
					triangle_array[triangle_index + row_size],
					triangle_array[triangle_index + row_size + 1]
				)
			except:
				pass
			triangle_index += 1

	return triangle_array


if __name__ == "__main__":
	with open("p18.txt", "r") as input_file:
		input_text = input_file.read()
		# nano always includes an empty line at the end
		number_of_rows = len([item for item in input_text.split("\n") if len(item) > 0])

		input_str_list = input_text.replace("\n", " ").split(" ")
		input_list = [int(item) for item in input_str_list if item != ""]

		triangle_struct = initialize_triangle(input_list, number_of_rows)
		max_sum = triangle_struct[0].max_path_sum()
		print max_sum
