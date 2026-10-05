import './globals.css';
import type { Metadata } from 'next';

export const metadata: Metadata = {
  title: 'TripFlow — Smart Trip Planner',
  description: 'Plan routes, itineraries, budgets and group trips in one workspace.',
};

export default function RootLayout({children}:{children:React.ReactNode}){
  return <html lang="en"><body>{children}</body></html>;
}
