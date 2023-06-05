#include <iostream>
#include <vector>

using namespace std;

void maxHeapify(vector<int>& arr, int n, int i) {
    int largest = i;
    int left = 2 * i + 1;
    int right = 2 * i + 2;

    if (left < n && arr[left] > arr[largest])
        largest = left;

    if (right < n && arr[right] > arr[largest])
        largest = right;

    if (largest != i) {
        swap(arr[i], arr[largest]);
        maxHeapify(arr, n, largest);
    }
}

void buildMaxHeap(vector<int>& arr) {
    int n = arr.size();
    for (int i = n / 2 - 1; i >= 0; i--) {
        maxHeapify(arr, n, i);
    }
}

void minHeapify(vector<int>& arr, int n, int i) {
    int smallest = i;
    int left = 2 * i + 1;
    int right = 2 * i + 2;

    if (left < n && arr[left] < arr[smallest])
        smallest = left;

    if (right < n && arr[right] < arr[smallest])
        smallest = right;

    if (smallest != i) {
        swap(arr[i], arr[smallest]);
        minHeapify(arr, n, smallest);
    }
}

void buildMinHeap(vector<int>& arr) {
    int n = arr.size();
    for (int i = n / 2 - 1; i >= 0; i--) {
        minHeapify(arr, n, i);
    }
}

int main() {
    vector<int> marks;
    int a;
    cout << "Enter 5 marks: ";
    for (int i = 0; i < 5; i++) {
        cin >> a;
        marks.push_back(a);
    }

    // Max heap
    buildMaxHeap(marks);

    cout << "Max heap: ";
    for (int mark : marks) {
        cout << mark << " ";
    }
    cout << endl;

    int maxElement = marks[0];
    cout << "Maximum element: " << maxElement << endl;

    // Min heap
    buildMinHeap(marks);

    cout << "Min heap: ";
    for (int mark : marks) {
        cout << mark << " ";
    }
    cout << endl;

    int minElement = marks[0];
    cout << "Minimum element: " << minElement << endl;

    return 0;
}
