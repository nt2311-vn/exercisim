#[derive(Debug)]
pub struct HighScores {
    scores: Vec<u32>,
}

impl HighScores {
    pub fn new(scores: &[u32]) -> Self {
        HighScores {
            scores: scores.to_vec(),
        }
    }

    pub fn scores(&self) -> &[u32] {
        &self.scores
    }

    pub fn latest(&self) -> Option<u32> {
        self.scores.last().copied()
    }

    pub fn personal_best(&self) -> Option<u32> {
        self.scores.iter().max().copied()
    }

    pub fn personal_top_three(&self) -> Vec<u32> {
        if self.scores.len() <= 3 {
            let mut sorted = self.scores.clone();
            sorted.sort();
            sorted.reverse();
            return sorted;
        }

        let mut sorted = self.scores.clone();
        sorted.sort();
        sorted.reverse();
        sorted[..3].to_vec()
    }
}
