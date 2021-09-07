# https://leetcode.com/explore/challenge/card/september-leetcoding-challenge-2021/636/week-1-september-1st-september-7th/3965/
# link to question is found above


class Solution:
    def slowestKey(self, releaseTimes: List[int], keysPressed: str) -> str:
        index = 0
        current = releaseTimes[0]
        ans = keysPressed[0]
        for i in range(len(keysPressed)-1):
            temp = releaseTimes[i+1] - releaseTimes[i]
            if temp == current and ans < keysPressed[i+1]:
                ans = keysPressed[i+1]
            if temp > current:
                current = temp
                ans = keysPressed[i+1]
                if current < releaseTimes[0]:
                    current = releaseTimes[0]
                    ans = keysPressed[0]
        return ans
