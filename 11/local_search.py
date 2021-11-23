import operator as op

class LocalSearch():

    def neighbors(self, s):
        pass

    def legal_neighbors(self, s):
        pass

    def select_next(self, s):
        pass

    def satisfiable(self, s):
        pass

    def objective_value(self, s):
        pass

    def initial_solution(self):
        pass
    
    def print_solution(self, s):
        print(s)

    def optimize(self, max_iterations, minimize=True):
        s = self.initial_solution()
        best = s
        if minimize:
            better_than = op.lt
        else:
            better_than = op.gt
        for _ in range(max_iterations):
            if self.satisfiable(s):
                #self.print_solution(s)
                if better_than(self.objective_value(s),
                               self.objective_value(best)):
                    best = s
            next = self.select_next(s)
            if not next:
                break
            s = next
        self.print_solution(s)
