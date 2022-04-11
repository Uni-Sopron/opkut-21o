from os import curdir
from local_search import LocalSearch

class TSP(LocalSearch):
    def __init__(self, input_file) -> None:
        super().__init__()
        with open(input_file) as f:
            self.places = f.readline().strip().split()
            self.distances = []
            for line in f.readlines():
                d = [float(x) for x in line.strip().split()]
                self.distances.append(d)
    
    def neighbors(self, s):
        for start in range(len(self.places)-1):
            for end in range(start+1, len(self.places)):
                yield s[:start] + list(reversed(s[start:end+1])) + s[end+1:]

    def legal_neighbors(self, s):
        current = self.objective_value(s)
        for n in self.neighbors(s):
            #print(self.objective_value(n))
            if self.objective_value(n) < current:
                yield n

    def select_next(self, s):
        best = None
        best_obj = None
        for n in self.legal_neighbors(s):
            current_obj = self.objective_value(n)
            if best == None or current_obj < best_obj:
                best = n
                best_obj = current_obj
        return best

    def satisfiable(self, s):
        return True

    def objective_value(self, s):
        cost = self.distances[s[-1]][s[0]]
        for i in range(len(self.places)-1):
            cost += self.distances[s[i]][s[i+1]]
        return cost

    def initial_solution(self):
        return list(range(len(self.places)))
    
    def print_solution(self, s):
        for i in s:
            print(self.places[i], end=' -> ')
        print(self.places[s[0]])
        print(f'Total distance: {self.objective_value(s)}')

if __name__ == '__main__':
    tsp = TSP('tsp.txt')
    tsp.optimize(1000)