
# [7,5,4,3,2,6,1] length 7
# [6,2,8,7,5,1,4,3] length 8

def merge_sort(arr)
  return arr if arr.length < 2
  # p "arr: #{arr}"

  middle = arr.length / 2
  # p "middle: #{middle}"

  left_half = merge_sort(arr[0...middle])
  # p "left_half: #{left_half}"
  right_half = merge_sort(arr[middle...arr.length])
  # p "right_half: #{right_half}"

  sorted = []
  until left_half.empty? || right_half.empty?
    left_half.first <= right_half.first ? sorted << left_half.shift : sorted << right_half.shift
  end
  # p "sorted: #{sorted}"
  # p "sorted + left_half + right_half: #{sorted + left_half + right_half}"
  sorted + left_half + right_half
end

# merge_sort([42,543,132,3,5,6,432,54,64,23])