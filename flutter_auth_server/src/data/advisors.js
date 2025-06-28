const advisors = [
  {
    id: 1,
    name: "Dr. Tarek Shafik",
    specialty: "Education Strategy",
    rating: 4.9,
    email: "Tarek@xedu.app",
    bio: "Co-Founder of Xedu, 10+ years mentoring students.",
    imageUrl: "http://192.168.1.100:3000/images/tarek_shafik.png", // Update this
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
    imageUrl: "https://i.pravatar.cc/150?img=24",
    sessions: [],
  },
  {
    id: 3,
    name: "Youssef Adel",
    specialty: "Medicine & UK Universities",
    rating: 4.6,
    email: "youssef@xedu.app",
    bio: "Helps Egyptian students get into med school in the UK.",
    imageUrl: "https://i.pravatar.cc/150?img=33",
    sessions: [],
  },
];

module.exports = advisors;
