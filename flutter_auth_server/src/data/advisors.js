const advisors = [
  {
    id: 1,
    name: "Dr. Karim Elsharkawy",
    specialty: "Education Strategy",
    rating: 4.9,
    email: "karim@xedu.app",
    bio: "Founder of Xedu, 10+ years mentoring students.",
    image: "https://i.pravatar.cc/150?img=12",
    sessions: [
      { id: 1, date: "2025-07-01", studentName: "Ali Mohamed" },
      { id: 2, date: "2025-07-02", studentName: "Sarah Ahmed" },
    ],
  },
  {
    id: 2,
    name: "Fatma Ibrahim",
    specialty: "Computer Science",
    rating: 4.8,
    email: "fatma@xedu.app",
    bio: "MIT grad, helps students apply to US/UK CS programs.",
    image: "https://i.pravatar.cc/150?img=24",
    sessions: [],
  },
  {
    id: 3,
    name: "Youssef Adel",
    specialty: "Medicine & UK Universities",
    rating: 4.6,
    email: "youssef@xedu.app",
    bio: "Helps Egyptian students get into med school in the UK.",
    image: "https://i.pravatar.cc/150?img=33",
    sessions: [],
  },
];

module.exports = advisors;
