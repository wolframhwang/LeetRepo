#define MX 100000

struct Cache {
        int value;
        struct Cache *prev, *next;
} node[MX];

typedef struct Cache Cache;

typedef struct {
        int cap;
        int cur;
        Cache front, rear;
} LRUCache;
LRUCache proto;

LRUCache* lRUCacheCreate(int capacity) {
        for(int i = 0; i < MX; i++){
                node[i].prev = 0;
                node[i].next = 0;
        }
        proto.cap = capacity;
        proto.cur = 0;
        proto.front.next = &(proto.rear);
        proto.rear.prev = &(proto.front);
        return &proto;
}

int lRUCacheGet(LRUCache* obj, int key) {
        int ret = 0;
        if (node[key].prev != 0 && node[key].next != 0) {
                ret = node[key].value;
                node[key].prev->next = node[key].next;
                node[key].next->prev = node[key].prev;    
            
                node[key].prev = &obj->front;
                node[key].next = obj->front.next;
                obj->front.next->prev = &node[key];
                obj->front.next = &node[key];
        }else{
                return -1;
        }
        return ret;
}

void lRUCachePut(LRUCache* obj, int key, int value) {
        if (node[key].prev != 0 && node[key].next != 0) {//Not New
                node[key].prev->next = node[key].next;
                node[key].next->prev = node[key].prev;        
            
                node[key].value = value;
                node[key].prev = &obj->front;
                node[key].next = obj->front.next;
                obj->front.next->prev = &node[key];
                obj->front.next = &node[key];
        }else {// New
                node[key].value = value;
                node[key].prev = &obj->front;
                node[key].next = obj->front.next;
                obj->front.next->prev = &node[key];
                obj->front.next = &node[key];
                obj->cur += 1;
                if (obj->cur > obj->cap) {
                        obj->cur -= 1;
                        Cache *node = obj->rear.prev;
                        obj->rear.prev->prev->next = &obj->rear;
                        obj->rear.prev = obj->rear.prev->prev;
                        node->prev = 0;
                        node->next = 0;                        
                }
        }
}

void lRUCacheFree(LRUCache* obj) {
    obj = 0;
}

/**
 * Your LRUCache struct will be instantiated and called as such:
 * LRUCache* obj = lRUCacheCreate(capacity);
 * int param_1 = lRUCacheGet(obj, key);

 * lRUCachePut(obj, key, value);

 * lRUCacheFree(obj);
*/