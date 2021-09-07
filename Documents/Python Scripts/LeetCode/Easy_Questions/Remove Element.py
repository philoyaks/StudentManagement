class Solution:
    def removeElement(self, nums: List[int], val: int) -> int:
        k = nums.count(val)
        ans = len(nums)-k
        while val in nums[:ans]:
            for i in range(len(nums)-1):
                temp = nums[i]
                if nums[i] == val:
                    nums[i] = nums[i+1]
                    nums[i+1] = temp

        return ans

# link: https://leetcode.com/problems/remove-element/submissions/
