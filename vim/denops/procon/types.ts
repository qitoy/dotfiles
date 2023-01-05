export interface Problem extends Record<string, unknown> {
    url: string;
    name: string;
    context: {
        contest?: {
            url: string;
            name: string;
        };
        alphabet?: string;
    };
    memoryLimit?: number;
    timeLimit?: number;
    tests?: Test[];
}

export type Test = {
    input: string;
    output: string;
    name?: string;
}

export interface Contest {
    url: string;
    name: string;
    problems: Problem[];
}
