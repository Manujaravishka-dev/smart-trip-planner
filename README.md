# TripFlow — Smart Trip Planner

A desktop-first collaborative trip-planning website built with Next.js, React and TypeScript.

## Product direction
The planner combines patterns commonly used by modern travel planners: itinerary + map in one workspace, draggable/reorderable stops, route distance/time, reservations, collaborative planning, budgeting, suggestions, checklists and group chat.

## Current web prototype
- Responsive premium blue web UI
- Desktop trip workspace with itinerary and map side-by-side
- Multi-stop route preview with distance and driving-time summaries
- Day itinerary and route optimization action
- Reservations and checklist navigation
- Tripmate roles (Owner / Editor / Member)
- Budget summary
- Group suggestions/voting UI
- Group chat UI
- Mobile/tablet responsive layout

## Stack
- Next.js 16
- React 19
- TypeScript
- Lucide React
- Supabase Auth + PostgreSQL + Realtime (integration stage)
- ImageKit (integration stage)
- OpenStreetMap + routing/geocoding provider (integration stage)
- Open-Meteo weather (integration stage)

## Run
```bash
npm install
npm run dev
```

Open http://localhost:3000

## Next stages
1. Real OpenStreetMap map rendering and geocoding
2. Route distance/time calculation and stop reordering
3. Create/edit trip flows and destination discovery
4. Supabase authentication, trip/member data and permissions
5. Supabase Realtime collaboration and chat
6. ImageKit trip/profile/chat images
7. Budget splitting, reservations, checklist and weather
