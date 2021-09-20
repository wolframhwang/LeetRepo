
class Solution:
    def rob(self, nums: List[int]) -> int:
        dp = [[0 for j in range(len(nums))] for i in range(2)]
        dp[1][0] = nums[0]
        l = len(nums)
        for i in range(1, len(nums)):
            dp[1][i] = dp[0][i - 1] + nums[i]
            dp[0][i] = max(dp[1][i - 1], dp[0][i - 1])
        return max(dp[1][l - 1] , dp[0][l - 1])