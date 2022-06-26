
int max(int a, int b) { return a > b? a: b;}

int Sum(int start, int end, int *card) {
    int ret = 0;
    for(int i = start; i < end; i++) {
        ret += card[i];
    }
    return ret;
}
// 0 1 2 3
// 1,2,3,4 - len = 2
int maxScore(int* cardPoints, int cardPointsSize, int k){
    int sum = Sum(0, k, cardPoints);
    int right = 0;
    int answer = sum;
    if (k >= cardPointsSize) {
        return sum;
    }

    for (int i = 1; i <= k; i++) {
        sum = sum + (cardPoints[cardPointsSize - i] - cardPoints[k - i]);
        answer = max(sum, answer);
    }
    return answer;
}